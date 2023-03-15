<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_layout/Admin.Master" AutoEventWireup="true" CodeBehind="Manageorder.aspx.cs" Inherits="MobileHub.Admin_layout.Manageorder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="dist/css/manageorder.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- main content -->
    <div class="content-wrapper">
        <div class="container">

            <div class="row justify-content-center">
                <div class="col-lg-6 edit-col">
                    <div class="order_section">
                        <div class="card">
                            <div class="card-body">
                                <div class="order_section_title">
                                    Order Status
                                </div>
                                <div class="customer-content">
                                    <div class="form-group">
                                        <label>Order ID</label>
                                        <div class="row">
                                            <div class="col-md-10">

                                                <asp:TextBox ID="order_id" CssClass="form-control" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-md-2">
                                                <asp:Button Class=" form-control btn btn-primary" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" />

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>First Name:</label>
                                        <asp:TextBox CssClass="form-control" ID="fname" Enabled="False" runat="server">
                                        </asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label>Last Name:</label>
                                        <asp:TextBox CssClass="form-control" Enabled="False" ID="lname" runat="server">
                                        </asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label>Product Name:</label>
                                        <asp:TextBox CssClass="form-control" ID="txtPname" Enabled="False" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label>Quantity:</label>
                                        <asp:TextBox CssClass="form-control" ID="qty" Enabled="False" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="form-group">
                                        <label>GrantTotal:</label>
                                        <asp:TextBox CssClass="form-control" ID="total" Enabled="False" runat="server">
                                        </asp:TextBox>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group radio-order">
                                                <label>Payment Through:</label><br>
                                                <asp:RadioButtonList ID="payment" Enabled="False" runat="server">
                                                    <asp:ListItem Text="Khalti" Value="Khalti"></asp:ListItem>
                                                    <asp:ListItem Text="ESEWA" Value="ESEWA"></asp:ListItem>
                                                    <asp:ListItem Text="Credit/Debit card" Value="Credit/Debit card"></asp:ListItem>
                                                    <asp:ListItem Text="IME Pay" Value="IME Pay"></asp:ListItem>
                                                    <asp:ListItem Text="Cach on delivery" Value="Cach on delivery"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group radio-order">
                                                <label>Order Status:</label><br>
                                                <asp:RadioButtonList ID="status" runat="server">
                                                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                                    <asp:ListItem Text="Sent out for delivery" Value="Sent out for delivery"></asp:ListItem>
                                                    <asp:ListItem Text="Delivered" Value="Delivered"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <asp:Button ID="Button3" CssClass="btn btn-secondary btn-sm btn-block" runat="server" Text="Update" OnClick="Button3_Click" />
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="view_order">
                        <div class="card">
                            <div class="card-body">
                                <div class="view_order_title" style="text-align: center">
                                    <h3>Customer's Orders</h3>
                                </div>
                                <div class="order_content p-4 m-2">
                                    <div class="table-responsive">
                                        <asp:GridView ID="GridView1" runat="server" class="table table-striped" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Order_ID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
                                            <Columns>
                                                <asp:BoundField DataField="Order_ID" HeaderText="Order ID" InsertVisible="False" ReadOnly="True" SortExpression="Order_ID" />
                                                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                                <asp:BoundField DataField="PName" HeaderText="Product Name" SortExpression="PName" />
                                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                                <asp:BoundField DataField="GrandTotal" HeaderText="GrandTotal" SortExpression="GrandTotal" />
                                                <asp:BoundField DataField="PaymentThrough" HeaderText="Payment Method" SortExpression="PaymentThrough" />
                                                <asp:BoundField DataField="Order_Status" HeaderText="Order Status" SortExpression="Order_Status" />
                                                <asp:BoundField DataField="Order_date" HeaderText="Ordered Date" SortExpression="Order_date" />
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
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection %>" SelectCommand="SELECT [Order_ID], [FirstName], [LastName], [PName], [Quantity], [GrandTotal], [PaymentThrough], [Order_Status], [Order_date] FROM [Order_tb]"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
