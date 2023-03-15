<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="MobileHub.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-holder bg-light">

        <section class="py-5">
            <div class="container">


                <div class="row mb-5">
                    <asp:Repeater ID="rptrProduct" runat="server">
                        <ItemTemplate>
                            <div class="col-lg-6">

                                <!-- PRODUCT SLIDER-->
                                <div class="row m-sm-0">



                                    <div class="col-sm order-1 order-sm-2">
                                        <%--<div class="owl-carousel product-slider" data-slider-id="1">--%>


                                        <%-- <img class="img-fluid" src="image/samsung-note-20-1-nepal.jpg" alt="...">--%>
                                        <asp:HiddenField ID="PID" Value='<%# Eval("PID") %>' runat="server" />
                                        <img class="img-fluid" src="Productimg/<%# Eval("Pimage") %> " alt="Image not found." onerror="this.src='image/no-image.png'">
                                        </a>
                  

                 <%-- </div>--%>
                                    </div>

                                </div>
                            </div>



                            <!-- PRODUCT DETAILS-->
                            <div class="col-lg-6">
                                <%--<ul class="list-inline mb-2">
                <li class="list-inline-item m-0"><i class="fas fa-star small text-warning"></i></li>
                <li class="list-inline-item m-0"><i class="fas fa-star small text-warning"></i></li>
                <li class="list-inline-item m-0"><i class="fas fa-star small text-warning"></i></li>
                <li class="list-inline-item m-0"><i class="fas fa-star small text-warning"></i></li>
                <li class="list-inline-item m-0"><i class="fas fa-star small text-warning"></i></li>
              </ul>--%>

                                <h1><%#Eval("PName") %></h1>

                                <p class="text-muted lead">
                                    Rs.<asp:Label ID="Price" runat="server" Text='<%#Eval("Price") %> '></asp:Label>
                                </p>

                                <p class="text-small mb-4"><%#Eval("Description") %> </p>


                                <div class="row align-items-stretch mb-4">
                                    <div class="col-sm-5 pr-sm-0">
                                        <div class="border d-flex align-items-center justify-content-between py-1 px-3 bg-white border-white">
                                            <span class="small text-uppercase text-gray mr-4 no-select">Quantity</span>

                                            <div class="quantity">
                                                <asp:DropDownList ID="DropDownList_qty" runat="server">
                                                    <asp:ListItem>1</asp:ListItem>
                                                    <asp:ListItem>2</asp:ListItem>
                                                    <asp:ListItem>3</asp:ListItem>
                                                    <asp:ListItem>4</asp:ListItem>

                                                </asp:DropDownList>


                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-3 pl-sm-0">
                                        <asp:Button ID="AddtoCart" class="btn btn-dark btn-sm btn-block h-100 d-flex align-items-center justify-content-center px-0" runat="server" Text="Add to Cart" OnClick="AddtoCart_Click" />

                                    </div>

                                </div>



                                <ul class="list-unstyled small d-inline-block">
                                    <li class="px-3 py-2 mb-1 bg-white"><strong class="text-uppercase">PID:</strong><span class="ml-2 text-muted"><%#Eval("PID") %> </span></li>




                                </ul>
                            </div>


                        </ItemTemplate>
                    </asp:Repeater>
                </div>




                <!-- DETAILS TABS-->
                <ul class="nav nav-tabs border-0" id="myTab" role="tablist">
                    <%-- <li class="nav-item"><a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">Description</a></li>--%>
                    <li class="nav-item"><a class="nav-link active" id="reviews-tab" data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">Reviews</a></li>
                </ul>
                <div class="tab-content mb-5" id="myTabContent">

                    <div class="tab-pane fade show active" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">

                        <div class="p-4 p-lg-5 bg-white">
                            <div class="row">

                                <asp:Repeater ID="rptrCustomerRatings" runat="server">
                                    <ItemTemplate>
                                        <div class="col-lg-8">
                                            <div class="media mb-3">
                                                <img class="rounded-circle" src="img/customer-1.png" alt="" width="50">
                                                <div class="media-body ml-3">
                                                    <h6 class="mb-0 text-uppercase"><%#Eval("Name") %></h6>
                                                    <p class="small text-muted mb-0 text-uppercase"><%#Eval("Feedback_date") %></p>
                                                    <b style="color: #e7ab3c;">Ratings :

                                                        <%#Eval("Ratings") %> </b>

                                                    <p class="text-small mb-0 text-muted"><%#Eval("Message") %></p>
                                                </div>
                                            </div>

                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>


                            </div>
                        </div>


                    </div>

                    <div class="container" style="padding: 10px;">
                        <div class="card">
                            <div class="card-body">

                                <div class="row" style="padding: 35px 90px 0px 70px;">
                                    <div class="col">
                                        <h6>Give Your Review</h6>
                                        <div class="row">
                                            <div class="col-lg-6 form-group">
                                                <asp:TextBox ID="name" CssClass="form-control" runat="server" placeholder="Full Name"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-6 form-group">
                                                <asp:TextBox ID="email" CssClass="form-control" TextMode="Email" runat="server" placeholder="Your Email"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 form-group">
                                                <asp:TextBox CssClass="form-control" ID="message" runat="server"
                                                    placeholder="Messages" TextMode="MultiLine" Rows="2" cols="20"></asp:TextBox>
                                                <br />
                                            </div>
                                            <div class="col-lg-12 form-group">
                                                <label>Give Ratings:</label>
                                                <asp:RadioButtonList ID="ratings" runat="server">

                                                    <asp:ListItem Text="Bad" Value="Bad"></asp:ListItem>
                                                    <asp:ListItem Text="Poor" Value="Poor"></asp:ListItem>
                                                    <asp:ListItem Text="Average" Value="Average"></asp:ListItem>
                                                    <asp:ListItem Text="Great" Value="Great"></asp:ListItem>
                                                    <asp:ListItem Text="Excellent" Value="Excellent"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:Button ID="Feedback_btn" class="btn btn-outline-warning btn-sm" runat="server" Text="Send Review" OnClick="Feedback_btn_Click" />
                                            </div>

                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
    </div>
</asp:Content>

