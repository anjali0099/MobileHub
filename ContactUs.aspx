<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="MobileHub.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <!-- HERO SECTION-->
        <section class="py-5 bg-light">
            <div class="container">
                <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
                    <div class="col-lg-6">
                        <h1 class="h2 text-uppercase mb-0">Mobile Hub</h1>
                    </div>
                    <div class="col-lg-6 text-lg-right">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-lg-end mb-0 px-0">
                                <li class="breadcrumb-item"><a href="cart.html">Home</a></li>
                                <li class="breadcrumb-item"><a href="index.html">Contact us</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- Contact Section Begin -->

        <section class="py-5">

            <div class="container p-0">
                 <div class="card">
                        <div class="card-body">
                <div class="row">
                   
                            <div class="col-lg-6">
                                <div class="contact-form">
                                    <div class="leave-comment">
                                        <h6>Leave us a Message</h6>
                                        <br />
                                        <div class="row comment-form">
                                            <div class="form-group col-lg-6">
                                                <asp:TextBox CssClass="form-control" ID="Txtname" runat="server" placeholder="Your FullName"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-lg-6">
                                                <asp:TextBox CssClass="form-control" ID="Txtemail" runat="server" placeholder="Your Email" TextMode="Email"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-lg-12">
                                                <asp:TextBox CssClass="form-control" ID="Txtmessage" runat="server" placeholder="Your Message" TextMode="MultiLine" Rows="6"></asp:TextBox>
                                                <br>
                                                <asp:Button ID="sendmessage" class="btn btn-outline-warning btn-sm" runat="server" Text="Send Message" OnClick="sendmessage_Click" />
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6" style="padding: 0px 60px;">
                                <div class="contact-title">
                                    <p><i>"For more inquires, you can contact us."</i> </p>
                                </div>
                                <br />
                                <div class="contact-widget">
                                    <div class="cw-item">
                                        <div class="ci-icon">
                                            <i class="ti-location-pin"></i>
                                        </div>
                                        <div class="ci-text">
                                            <b><span>Address:</span></b>
                                            <p>Tripureshor, Kathmandu 44600</p>
                                        </div>
                                    </div>
                                    <div class="cw-item">
                                        <div class="ci-icon">
                                            <i class="ti-mobile"></i>
                                        </div>
                                        <div class="ci-text">
                                            <b><span>Phone:</span></b>
                                            <p>+977 9849876537</p>
                                        </div>
                                    </div>
                                    <div class="cw-item">
                                        <div class="ci-icon">
                                            <i class="ti-email"></i>
                                        </div>
                                        <div class="ci-text">
                                            <b><span>Email:</span></b>
                                            <p>mobilehub@gmail.com</p>
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
    <!-- Contact Section End -->
</asp:Content>
