<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="Oneplus.aspx.cs" Inherits="MobileHub.Oneplus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <!-- HERO SECTION-->
        <section class="py-5 bg-light">
          <div class="container">
            <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
              <div class="col-lg-6">
                <h1 class="h2 text-uppercase mb-0">Mobile</h1>
              </div>
              <div class="col-lg-6 text-lg-right">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb justify-content-lg-end mb-0 px-0">
                      <li class="breadcrumb-item"><a href="cart.html">Home</a></li>
                    <li class="breadcrumb-item"><a href="index.html">Mobile</a></li>
                    <li class="breadcrumb-item active" aria-current="page">OnePlus</li>
                  </ol>
                </nav>
              </div>
            </div>
          </div>
        </section>


        <section class="py-5">

          <div class="container p-0">
            <div class="row">
             

              <!-- SHOP LISTING-->
              <div class="col-lg order-1 order-lg-2 mb-5 mb-lg-0">

                <div class="row">
                    <asp:Repeater ID="rptrProduct" runat="server">
                                <ItemTemplate>

                  <!-- PRODUCT-->
                  <div class="col-lg-4 col-sm-6">
                    <div class="product text-center">
                      <div class="mb-3 position-relative">
                        <div class="badge text-white badge-"></div><a class="d-block" href="ProductDetail.aspx"> 
                            <asp:HiddenField ID="PID" Value='<%# Eval("PID") %>' runat="server" />
                            <img class="img-fluid w-100" src="Productimg/<%# Eval("Pimage") %> " alt="Image not found."> </a>
                            
                        <div class="product-overlay">
                          <ul class="mb-0 list-inline">
                            
                            <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-dark" href="ProductDetail.aspx?PID=<%# Eval("PID") %>">View</a></li>
                            
                          </ul>
                        </div>
                      </div>
                        
                      <h6> <a class="reset-anchor" > <%#Eval("PName") %> </a></h6>
                      <p class="small text-muted">Rs. <%# Eval ("Price") %></p>
                    </div>
                  </div>

            </ItemTemplate>
                    </asp:Repeater>

                </div>

              </div>
                                   
            </div>
              
          </div>
        </section>
      </div>
</asp:Content>
