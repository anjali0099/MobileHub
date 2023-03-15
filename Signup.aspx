<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="MobileHub.Signup" %>
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
                            <img src="img/login.png" class="img-fluid rounded" style="height: 700px; width: 500px;" />

                        </center>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4 class="font-weight-normal ">Registration Form</h4>
                                    <h6 class="font-italic font-weight-normal">"Register your account here.." </h6>
                                </center>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-12" style="padding: 30px 30px 0px 50px;">

                                <div class="form-group">
                                    <label>First Name</label>
                                    <asp:TextBox CssClass="form-control" ID="fname" runat="server" placeholder="First Name"></asp:TextBox>
                                </div>


                                <div class="form-group">
                                    <label>Last Name</label>
                                    <asp:TextBox CssClass="form-control" ID="lname" runat="server" placeholder="Last Name"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label>Address</label>
                                    <asp:TextBox CssClass="form-control" ID="Address" runat="server" placeholder="Address"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Email Address</label>
                                    <asp:TextBox CssClass="form-control" ID="Email" TextMode="Email" runat="server" placeholder="Email Address"></asp:TextBox>
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                 <div class="form-group">
                                    <label>Phone Number</label>
                                    <asp:TextBox CssClass="form-control" ID="phone" runat="server" placeholder="Phone Number"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Username</label>
                                    <asp:TextBox CssClass="form-control" ID="Username" runat="server" placeholder="Username" ></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox CssClass="form-control" ID="Password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>

                                </div>
                                <div class="form-group " style="text-align: center;">
                                    <asp:Button class="btn btn-outline-primary" ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
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

