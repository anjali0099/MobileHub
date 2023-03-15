<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="MobileHub.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container">
        <!-- HERO SECTION-->
        <section class="py-5 bg-light">
          <div class="container">
            <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
              <div class="col-lg-6">
                <h1 class="h2 text-uppercase mb-0">Checkout</h1>
              </div>
              <div class="col-lg-6 text-lg-right">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb justify-content-lg-end mb-0 px-0">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item"><a href="cart.html">Cart</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                  </ol>
                </nav>
              </div>
            </div>
          </div>
        </section>
        <section class="py-5">


          <!-- BILLING ADDRESS-->
          <h2 class="h5 text-uppercase mb-4">Billing details</h2>
          <div class="row">
            <div class="col-lg-8">
                <div class="row">
                  <div class="col-lg-6 form-group">
                    <label class="text-small text-uppercase" for="firstName">First name</label>
                      <asp:TextBox CssClass="form-control form-control-lg" ID="FirstName" runat="server" type="text" placeholder="Enter your first name"></asp:TextBox>
                    
                  </div>
                  <div class="col-lg-6 form-group">
                    <label class="text-small text-uppercase" for="lastName">Last name</label>
                      <asp:TextBox CssClass="form-control form-control-lg" ID="LastName" type="text" runat="server" placeholder="Enter your last name"></asp:TextBox>
                   </div>

                  <%--<div class="col-lg-6 form-group">
                    <label class="text-small text-uppercase" for="email">Email address</label>
                    <input class="form-control form-control-lg" id="email" type="email" placeholder="e.g. Jason@example.com">
                  </div>--%>

                  <div class="col-lg-12 form-group">
                    <label class="text-small text-uppercase" for="phone">Phone number</label>
                      <asp:TextBox CssClass="form-control form-control-lg" ID="Phone" runat="server" type="tel" placeholder="e.g. +97 9841535474"></asp:TextBox>
                    
                  </div>
                  <%--<div class="col-lg-6 form-group">
                    <label class="text-small text-uppercase" for="company">Company name (optional)</label>
                    <input class="form-control form-control-lg" id="company" type="text" placeholder="Your company name">
                  </div>
                  <div class="col-lg-6 form-group">
                    <label class="text-small text-uppercase" for="country">Country</label>
                    <select class="selectpicker country" id="country" data-width="fit" data-style="form-control form-control-lg" data-title="Select your country"></select>
                  </div>--%>
                  <div class="col-lg-12 form-group">
                    <label class="text-small text-uppercase" for="address">Region</label>
                     <asp:TextBox CssClass="form-control form-control-lg" ID="Address" runat="server" type="text" placeholder="Enter Your Region"></asp:TextBox>
                      
                  </div>
                  <%--<div class="col-lg-12 form-group">
                    <label class="text-small text-uppercase" for="address">Address line 2</label>
                    <input class="form-control form-control-lg" id="addressalt" type="text" placeholder="Apartment, Suite, Unit, etc (optional)">
                  </div>--%>
                  <div class="col-lg-6 form-group">
                    <label class="text-small text-uppercase" for="city">City</label>
                    <asp:TextBox CssClass="form-control form-control-lg" ID="City" runat="server" type="text" placeholder="Enter Your City"></asp:TextBox>
                      
                  </div>
                  <div class="col-lg-6 form-group">
                    <label class="text-small text-uppercase" for="state">Area</label>
                    <asp:TextBox CssClass="form-control form-control-lg" ID="Area" runat="server" type="text" placeholder="Enter Your Area"></asp:TextBox>
                      
                  </div>

                  <div class="col-lg-6 form-group">
                    <div class="custom-control custom-checkbox">
                      <input class="custom-control-input" id="alternateAddressCheckbox" type="checkbox">
                      <label class="custom-control-label text-small" for="alternateAddressCheckbox">Pay Us Through</label>
                    </div>
                  </div>

                  <div class="col-lg-12">
                    <div class="row d-none" id="alternateAddress">
                        <div class="payment_options mt-4 col-lg-6">
                                        <div class="col-lg-6 form-group">
                                        <asp:RadioButtonList  id="payment" runat="server">
                                           <asp:ListItem Text="Khalti" Value="Khalti"></asp:ListItem>
                                           <asp:ListItem Text="ESEWA" Value="ESEWA"></asp:ListItem>
                                            <asp:ListItem Text="Credit/Debit card" Value=" Credit/Debit card"></asp:ListItem>
                                           <asp:ListItem Text="IME Pay" Value="IME Pay"></asp:ListItem>
                                            <asp:ListItem Text="Cach on delivery" Value=" Cach on delivery"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                 </div>
                        
                        <%--<div class="col-12 mt-4">
                        <h2 class="h4 text-uppercase mb-4"> PAY THROUGH </h2>
                      </div>
                      <div class="col-lg-6 form-group">
                        <label class="text-small text-uppercase" for="firstName2">First name</label>
                        <input class="form-control form-control-lg" id="firstName2" type="text" placeholder="Enter your first name">
                      </div>
                      <div class="col-lg-6 form-group">
                        <label class="text-small text-uppercase" for="lastName2">Last name</label>
                        <input class="form-control form-control-lg" id="lastName2" type="text" placeholder="Enter your last name">
                      </div>
                      <div class="col-lg-6 form-group">
                        <label class="text-small text-uppercase" for="email2">Email address</label>
                        <input class="form-control form-control-lg" id="email2" type="email" placeholder="e.g. Jason@example.com">
                      </div>
                      <div class="col-lg-6 form-group">
                        <label class="text-small text-uppercase" for="phone2">Phone number</label>
                        <input class="form-control form-control-lg" id="phone2" type="tel" placeholder="e.g. +02 245354745">
                      </div>
                      <div class="col-lg-6 form-group">
                        <label class="text-small text-uppercase" for="company2">Company name (optional)</label>
                        <input class="form-control form-control-lg" id="company2" type="text" placeholder="Your company name">
                      </div>
                      <div class="col-lg-6 form-group">
                        <label class="text-small text-uppercase" for="country2">Country</label>
                        <select class="selectpicker country" id="country2" data-width="fit" data-style="form-control form-control-lg" data-title="Select your country"></select>
                      </div>
                      <div class="col-lg-12 form-group">
                        <label class="text-small text-uppercase" for="address2">Address line 1</label>
                        <input class="form-control form-control-lg" id="address2" type="text" placeholder="House number and street name">
                      </div>
                      <div class="col-lg-12 form-group">
                        <label class="text-small text-uppercase" for="address2">Address line 2</label>
                        <input class="form-control form-control-lg" id="addressalt2" type="text" placeholder="Apartment, Suite, Unit, etc (optional)">
                      </div>
                      <div class="col-lg-6 form-group">
                        <label class="text-small text-uppercase" for="city3">Town/City</label>
                        <input class="form-control form-control-lg" id="city3" type="text">
                      </div>
                      <div class="col-lg-6 form-group">
                        <label class="text-small text-uppercase" for="state4">State/County</label>
                        <input class="form-control form-control-lg" id="state4" type="text">
                      </div>--%>

                    </div>
                  </div>


                  <div class="col-lg-12 form-group">
                      <asp:Button  type="submit" class="btn btn-dark" ID="placeorder" runat="server" Text="Place Order"  OnClick="placeorder_Click"/>
                    <%--<button class="btn btn-dark" type="submit">Place order</button>--%>
                  </div>

                </div>
             
            </div>

            <!-- ORDER SUMMARY-->
            <div class="col-lg-4">
                <asp:Repeater ID="rptrCart" runat="server">
                                    <ItemTemplate>

              <div class="card border-0 rounded-0 p-lg-4 bg-light">
                <div class="card-body">
                  <h5 class="text-uppercase mb-4">Your order</h5>
                  <ul class="list-unstyled mb-0">
                      <asp:HiddenField ID="UID" Value='<%# Eval("Username") %>' runat="server" />
                      <asp:HiddenField ID="PID" Value='<%# Eval("PID") %>' runat="server" />
                                        
                    <li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold"><%# Eval("PName")%> x <%# Eval ("Quantity")%></strong><span class="text-muted small">Rs.<%# Eval ("TotalPrice") %></span></li>
                    <li class="border-bottom my-2"></li>
                    <%--<li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold">OPPO F19 Pro Ultra</strong><span class="text-muted small">Rs. 41,990.00</span></li>--%>
                    
                    <li class="d-flex align-items-center justify-content-between"><strong class="text-uppercase small font-weight-bold">Total</strong><span>Rs. <%# Eval ("TotalPrice") %></span></li>
                  </ul>
                </div>
              </div>
                </ItemTemplate>
                                </asp:Repeater>

            </div>


          </div>
        </section>
      </div>
</asp:Content>

