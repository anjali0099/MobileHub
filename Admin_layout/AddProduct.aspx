<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_layout/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="MobileHub.Admin_layout.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        <h2>Add Product</h2>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <label>Product name:</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="txtPname" runat="server"
                                placeholder="Product Name"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <label>Category: </label>
                        <div class="form-group">
                            <asp:DropDownList CssClass="form-control" ID="category" runat="server" DataSourceID="SqlDataSource1" DataTextField="Cat_Name" DataValueField="Cat_id">

                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MobileHub_dbConnectionString %>" SelectCommand="SELECT [Cat_id], [Cat_Name] FROM [Category_tb]"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>

                <%--For Top Image Change--%>
                <div class="row">
                    <div class="col-md-8">
                        <label>Upload a file</label>
                        <div class="form-group">
                            <asp:FileUpload ID="image" runat="server" />
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <label>Product Detail</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="txtPDetail" runat="server"
                                placeholder="Product Detail" TextMode="MultiLine" Rows="4"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <label>Price:</label>
                        <div class="form-group">
                            <asp:TextBox class="form-control" ID="txtPrice" runat="server" placeholder="Input Price ">
                            </asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <%--Add Button--%>
                    <div class="col-md-4">
                        <asp:Button CssClass="btn btn-primary btn-lg btn-block" ID="AddButton" runat="server"
                            Text="Add" OnClick="AddButton_Click" />
                    </div>
                </div>
                <br />
        </div>
        </section>
        <!-- /maincontent -->
    </div>

</asp:Content>
