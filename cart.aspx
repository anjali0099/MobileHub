<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="MobileHub.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">



        <!-- HERO SECTION-->
        <section class="py-5 bg-light">
          <div class="container">
            <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
              <div class="col-lg-6">
                <h1 class="h2 text-uppercase mb-0">Cart</h1>
              </div>
              <div class="col-lg-6 text-lg-right">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb justify-content-lg-end mb-0 px-0">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Cart</li>
                  </ol>
                </nav>
              </div>
            </div>
          </div>
        </section>





        <section class="py-5">
          <h2 class="h5 text-uppercase mb-4">Shopping cart</h2>
          <div class="row">
               <asp:Repeater ID="rptrCart" OnItemCommand="rptrCart_ItemCommand" runat="server">
                    <ItemTemplate>


            <div class="col-lg-8 mb-4 mb-lg-0">
              <!-- CART TABLE-->
              <div class="table-responsive mb-4">
                <table class="table">
                  <thead class="bg-light">
                    <tr>
                      <th class="border-0" scope="col"> <strong class="text-small text-uppercase">Product</strong></th>
                      <th class="border-0" scope="col"> <strong class="text-small text-uppercase">Price</strong></th>
                      <th class="border-0" scope="col"> <strong class="text-small text-uppercase">Quantity</strong></th>
                      <th class="border-0" scope="col"> <strong class="text-small text-uppercase">Total</strong></th>
                      <th class="border-0" scope="col"> </th>
                    </tr>
                  </thead>


                  <tbody>
                    <tr>
                      <th class="pl-0 border-0" scope="row">

                          <asp:HiddenField ID="UID" Value='<%# Eval("Username") %>' runat="server" />
                          <asp:HiddenField ID="PID" Value='<%# Eval("PID") %>' runat="server" />
                          <asp:HiddenField ID="Cart_ID" Value='<%# Eval("Cart_ID") %>' runat="server" />

                        <div class="media align-items-center">
                            <a class="reset-anchor d-block animsition-link" href="detail.html">
                                <img src="Productimg/<%# Eval("Pimage") %>" alt="Image not found." width="70">
                            </a>

                          <div class="media-body ml-3">
                              <strong class="h6">
                              <a class="reset-anchor animsition-link" href="detail.html">
                                  <%#Eval("PName") %>
                              </a>
                              </strong>
                          </div>

                        </div>
                      </th>
                      <td class="align-middle border-0">
                        <p class="mb-0 small">Rs.<%# Eval ("Price") %></p>
                      </td>
                      <td class="align-middle border-0">
                            <div class="quantity">
                                <%# Eval ("Quantity") %>
                           
                         </div>
                      </td>
                      <td class="align-middle border-0">
                        <p class="mb-0 small">Rs.<%# Eval("TotalPrice") %></p>
                      </td>

                      <td class="align-middle border-0 reset-anchor">
                          <asp:LinkButton ID="LinkButton1" CommandName="Delete" 
                                            
                                            OnClientClick="javascript:if(!confirm('Cick Confirm to delete item from Cart'))return false;"
                                            CommandArgument='<%# Eval("Cart_ID") %>'
                                            runat="server">
                                            <i class="fas fa-trash-alt small text-muted"></i>

                                        </asp:LinkButton>
                         
                       </td>

                    </tr>
                    
                  </tbody>


                </table>
              </div>
              <!-- CART NAV-->
              <div class="bg-light px-4 py-3">
                <div class="row align-items-center text-center">
                  <div class="col-md-6 mb-3 mb-md-0 text-md-left"><a class="btn btn-link p-0 text-dark btn-sm" href="userindex.aspx"><i class="fas fa-long-arrow-alt-left mr-2"> </i>Continue shopping</a></div>
                  <div class="col-md-6 text-md-right"><a class="btn btn-outline-dark btn-sm" href='checkout.aspx?Cart_ID=<%# Eval("Cart_ID") %>'>Procceed to checkout<i class="fas fa-long-arrow-alt-right ml-2"></i></a></div>
                </div>
              </div>
            </div>


            <!-- ORDER TOTAL-->
            <div class="col-lg-4">
              <div class="card border-0 rounded-0 p-lg-4 bg-light">
                <div class="card-body">
                  <h5 class="text-uppercase mb-4">Cart total</h5>
                  <ul class="list-unstyled mb-0">
                    <%--<li class="d-flex align-items-center justify-content-between"><strong class="text-uppercase small font-weight-bold">Subtotal</strong><span class="text-muted small">Rs. 171,989</span></li>--%>
                    <li class="border-bottom my-2"></li>
                    <li class="d-flex align-items-center justify-content-between mb-4"><strong class="text-uppercase small font-weight-bold">Total</strong><span>Rs.<%# Eval("TotalPrice") %></span></li>
                    
                      
                  </ul>
                </div>
              </div>
            </div>

              </ItemTemplate>
                    </asp:Repeater>


          </div>
        </section>
      </div>
</asp:Content>

