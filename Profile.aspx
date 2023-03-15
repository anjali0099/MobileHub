<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="MobileHub.Profile" %>

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

        <%--User profile--%>
        <section>
            <div class="container p-0">
                <div class="user-profile">
                    <section class="profile-section">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <div class="profile-wrap p-4 p-md-5">
                                        <div class="d-flex align-items-center justify-content-center">
                                            <h1 class="mb-5">User Profile</h1>
                                        </div>

                                        <div class="form-group">
                                            <label>First Name</label>
                                            <asp:TextBox ID="Firstname" class="form-control rounded-left" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Last Name</label>
                                            <asp:TextBox ID="Lastname" class="form-control rounded-left" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Address</label>
                                            <asp:TextBox ID="Address" class="form-control rounded-left" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Email Address</label>
                                            <asp:TextBox ID="Email" class="form-control rounded-left" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Phone Number</label>
                                            <asp:TextBox ID="Phonenumber" class="form-control rounded-left" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Username</label><br />
                                            <asp:TextBox ID="Username" CssClass="form-control rounded-left" runat="server" Enabled="False"></asp:TextBox>
                                        </div>
                                       <div class="form-group">
                                            <label>Password</label>
                                            <asp:TextBox ID="Password" class="form-control rounded-left" runat="server"></asp:TextBox>

                                        </div>
                                        <div class="profile-btn text-center">
                                            <asp:Button ID="Update" runat="server" class="btn btn-outline-primary" Text="Update" OnClick="Update_Click" />
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </section>
                </div>
                <!-- user-profile-end -->
            </div>
        </section>
    </div>
</asp:Content>
