<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="MobileHub.Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <!-- HERO SECTION-->
        <section class="py-5 bg-light">
            <div class="container">
                <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
                    <div class="col-lg-6">
                        <h1 class="h2 text-uppercase mb-0">MobileHub</h1>
                    </div>
                    <div class="col-lg-6 text-lg-right">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-lg-end mb-0 px-0">
                                <li class="breadcrumb-item"><a href="cart.html">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Profile</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </section>


        <section>
            <div class="container p-0">
                <%--Track Order--%>
                <div class="tracking-order m-2 mb-4">
                    <div class="container">
                        <h2 class="text-center m-4">Track Order</h2>


                        <asp:Repeater ID="rptrorder" OnItemCommand="rptrorder_ItemCommand" runat="server">
                            <ItemTemplate>
                                <div class="card">
                                    <div class="card-body">
                                        <div class="table-responsive mx-auto">
                                            <table class="table table-striped custom-table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" class="left-col">Order ID: <%# Eval("Order_ID") %> </th>
                                                        <th scope="col" class="right-col">Status: <%# Eval("Order_Status") %> </th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr scope="row">
                                                        <td colspan="2">
                                                            <label>Ordered Date:</label>
                                                            <%# Eval("Order_date") %>  
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <label>Product Name:</label>
                                                            <%# Eval("PName") %>  
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td colspan="2">
                                                            <label>Quantity:</label>
                                                            <%# Eval("Quantity") %>  
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td colspan="2">
                                                            <label>Total Cost:</label>
                                                            <%# Eval("GrandTotal") %>  
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td colspan="2">
                                                            <label>Delivered To:</label>
                                                            <%# Eval("FirstName") %> <%# Eval("LastName") %>  
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td colspan="2">
                                                            <label>Address:</label>
                                                            <%# Eval("Address") %>
                                                            <%# Eval("City") %>
                                                            <%# Eval("Area") %>  
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td colspan="2">
                                                            <label>Phone Number:</label>
                                                            <%# Eval("PhoneNumber") %>  
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td colspan="2">
                                                            <label>Payment Method:</label>
                                                            <%# Eval("PaymentThrough") %>  
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="cancel-btn text-right mx-auto">
                                            <asp:LinkButton ID="LinkButton1" CommandName="Cancel" 
                                            
                                            OnClientClick="javascript:if(!confirm('Click ok to Cancel Order'))return false;"
                                            CommandArgument='<%# Eval("Order_ID") %>'
                                            runat="server" class="btn btn-danger" Text="Cancel Order">
                                            

                                        </asp:LinkButton>
                                           
                                        </div>

                                    </div>
                                </div>

                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                </div>

                <!-- Track Order -->
            </div>
        </section>
    </div>
</asp:Content>
