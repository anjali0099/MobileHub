<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="MobileHub.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="container">
        <div class="card">
            <div class="card-body">

                <div class="row">
                    <div class="col-md-6">
                        <center>
                            <img src="img/login.png" class="img-fluid rounded" style="height: 360px;width: 500px;"/>

                        </center>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4 class="font-weight-normal text-monospace">LOGIN</h4>
                                    <h6 class="font-italic font-weight-normal">"Sign into your account." </h6>
                                </center>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-12" style=" padding: 30px 30px 0px 50px;">
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="username" runat="server" placeholder="User Name"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="form-group " style="text-align:center;">
                                    <asp:Button class="btn btn-outline-primary" ID="Button1" runat="server" Text="LOGIN" OnClick="Button1_Click" />
                                </div>

                                <div class="form-group" style="text-align:center;">
                                    <p class="small text-muted mb-0">Don't have an account? <strong><a href="Signup.aspx" class="text-black reset-anchor">Register here</a></strong></p>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>


    </div>
    <br />
    <br />
</asp:Content>

