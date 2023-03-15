<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_layout/Admin.Master" AutoEventWireup="true" CodeBehind="Manageusers.aspx.cs" Inherits="MobileHub.Admin_layout.Manageusers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Manage Users</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <button type="button" runat="server" class="btn btn-success" data-toggle="modal" data-target="#createusermodal">
                                <i class="fa fa-user-plus "></i>Add New Users
                            </button>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.content-header -->
        <!-- Main content -->
        <div class="clearfix"></div>
        <section class="content">
            <div class="container">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" class="table table-striped mytable" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
                                <Columns>
                                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                                    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                                    <asp:BoundField DataField="Userrole" HeaderText="Userrole" SortExpression="Userrole" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />

                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection %>" SelectCommand="SELECT [FirstName], [LastName], [Address], [Email], [Phone], [Username], [Userrole] FROM [User_tb]"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /maincontent -->
    </div>
    <!-- /.content-wrapper -->




    <!-- create modal -->

    <div class="modal fade" id="createusermodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="false">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalLongTitle">Create New User</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>


                <div class="modal-body">
                    <div class="form-group">
                        <label>
                            <h5>First Name</h5>
                        </label>
                        <%--<asp:TextBox CssClass="form-control" ID="FirstName" runat="server" placeholder="First Name"></asp:TextBox>--%>
                        <input type="text" class="form-control" id="fname" name="fname" placeholder="First Name" runat="server">
                    </div>
                    <div class="form-group">
                        <label>
                            <h5>Last Name</h5>
                        </label>
                        <%--<asp:TextBox CssClass="form-control" ID="Lastname" runat="server" placeholder="Last Name"></asp:TextBox>--%>
                        <input type="text" class="form-control" id="lname" name="lname" placeholder="Last Name" runat="server">
                    </div>
                    <div class="form-group">
                        <label>
                            <h5>Address</h5>
                        </label>
                        <%--<asp:TextBox CssClass="form-control" ID="Address" runat="server" placeholder="Address"></asp:TextBox>--%>
                        <input type="text" class="form-control" id="address" name="address" placeholder="Address" runat="server">
                    </div>
                    <div class="form-group">
                        <label>
                            <h5>Email Address</h5>
                        </label>
                        <%--<asp:TextBox CssClass="form-control" ID="Email" runat="server" placeholder="Email Address"></asp:TextBox>--%>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" runat="server">
                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                    </div>
                    <div class="form-group">
                        <label>Phone Number</label>
                        <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone Number" runat="server">
                    </div>
                    <div class="form-group">
                        <label>
                            <h5>Username</h5>
                        </label>
                        <%--<asp:TextBox CssClass="form-control" ID="Username" runat="server" placeholder="Email Address"></asp:TextBox>--%>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Username" runat="server">
                    </div>
                    <div class="form-group">
                        <label>
                            <h5>Password</h5>
                        </label>
                        <%--<asp:TextBox CssClass="form-control" ID="Password" runat="server" placeholder="Email Address"></asp:TextBox>--%>
                        <input type="password" class="form-control" id="password" name="password" runat="server">
                    </div>
                    <div class="form-group">
                        <label>
                            <h5>Select a role:</h5>
                        </label>
                        <asp:DropDownList ID="userrole" runat="server">
                            <asp:ListItem Value="Admin" Text="Admin"></asp:ListItem>
                            <asp:ListItem Value="Customer" Text="Customer"></asp:ListItem>
                        </asp:DropDownList>

                    </div>
                </div>

                <div class="modal-footer">
                    <asp:Button ID="Button2" runat="server" Text="Close" class="btn btn-secondary" data-dismiss="modal" />
                    <asp:Button ID="Submit" runat="server" Text="Save Data" OnClick="Submit_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

