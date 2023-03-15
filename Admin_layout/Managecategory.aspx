<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_layout/Admin.Master" AutoEventWireup="true" CodeBehind="Managecategory.aspx.cs" Inherits="MobileHub.Admin_layout.Managecategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-10">
                        <h2>Manage Category</h2>
                    </div>
                    <div class="col-sm-2">
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#createcategorymodal">
                            <i class="fa fa-plus-circle fa-fw"></i>Add new category
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.content-header -->
        <!-- Main content -->
        <div class="clearfix"></div>
        <section class="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-10" >
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" class="table table-striped mytable" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="Cat_id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
                                        <AlternatingRowStyle BackColor="#CCCCCC" />
                                        <Columns>
                                            <asp:BoundField DataField="Cat_id" HeaderText="Category ID" InsertVisible="False" ReadOnly="True" SortExpression="Cat_id" />
                                            <asp:BoundField DataField="Cat_Name" HeaderText="Category Name" SortExpression="Cat_Name" />
                                            <asp:CommandField ShowDeleteButton="True" />
                                        </Columns>
                                        <FooterStyle BackColor="#CCCCCC" />
                                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#808080" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#383838" />
                                    </asp:GridView>
                                
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection %>" DeleteCommand="DELETE FROM [Category_tb] WHERE [Cat_id] = @Cat_id" InsertCommand="INSERT INTO [Category_tb] ([Cat_Name]) VALUES (@Cat_Name)" SelectCommand="SELECT * FROM [Category_tb]" UpdateCommand="UPDATE [Category_tb] SET [Cat_Name] = @Cat_Name WHERE [Cat_id] = @Cat_id">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Cat_id" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Cat_Name" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Cat_Name" Type="String" />
                                            <asp:Parameter Name="Cat_id" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /maincontent -->
    </div>
    <!-- /.content-wrapper -->



    <!-- create category modal -->

    <div class="modal fade" id="createcategorymodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalLongTitle">New Category</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                        <label>
                            <h5>Category</h5>
                        </label>
                        <asp:TextBox class="form-control" ID="category" name="category" placeholder="Category" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <asp:Button ID="Submit" runat="server" Text="Save Data" OnClick="Submit_Click" />
                    <%--<button type="submit" class="btn btn-primary">Save Data</button>--%>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

