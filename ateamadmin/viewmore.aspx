<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewmore.aspx.cs" Inherits="testimonialImages_viewmore" Title="Details " %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
               		<div class="col-sm-12">
	                	<ol class="breadcrumb">
								<li>
									<i class="glyphicon glyphicon-home myiconcss"></i>
									<a href="#">
										Home
									</a>
								</li>
								<li class="active" >
								    Masters
								</li>
								<li >
									 view details
								</li>
								<%--<li class="search-box">
									<form class="sidebar-search" action="" method="post">
										<div class="form-group">
											<input type="text" placeholder="Start Searching..." />
											<button class="submit">
												<i class="glyphicon glyphicon-search"></i>
											</button>
										</div>
									</form>
								</li>--%>
							</ol>
    	            	<div class="page_header">
	                	<h1>
	                	    
	                	    <small><asp:Label ID="lblname" runat="server"></asp:Label></small>
	                	    <small class="pull-right" style="font-size:12px">
	                	        Last Login : <asp:Label runat="server" ID='lblLast'></asp:Label>
	                	        Reg Date : <asp:Label runat="server" ID='lblReg'></asp:Label>
	                	        <a class="btn btn-link" id="cvdown" runat="server" >Download CV</a>
	                	    </small>
                        </h1>
                    </div>
                   	</div>
                </div>
      <div class="row">
    	<div class="col-sm-3">
    	    <img id='profile' runat="server" class="img-thumbnail" src="./seekers_images/profile_default.png" style="height:230px;width:230px" />    
    	</div>
    	<div class="col-sm-9">
    	    <p>
    	    Name : <asp:Label ID="lblFname" runat="server"></asp:Label>
    	    </p>
    	    <p>
    	        Email :
    	        <asp:Label runat="server" ID="labEmail"></asp:Label>
    	    </p>
    	    <p>
    	        Contact No : 
    	        <asp:Label runat="server" ID="lblCont">
    	        </asp:Label>  
    	        
    	    </p>
    	    <p>
    	        Password :
    	        <asp:Label runat="server" ID="lblPass"></asp:Label>
    	    </p>
    	    <p>
    	        Gender :
	        <asp:Label runat="server" ID="lblGen"></asp:Label>
    	    </p>
    	    <p>
    	        Recvmail :
    	        <asp:Label runat="server" ID="lblRecv"></asp:Label>
    	    </p>
    	    <p>
    	        Third Party Mail :
    	        <asp:Label runat="server" ID="lblThird"></asp:Label>
    	    </p>
    	    <p>
    	        Paid for cv:
    	        <asp:Label ID="lblPaid" runat="server"></asp:Label>
    	    </p>
    	    <p>
    	        
    	    </p>
    	</div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            
            <p>
                Date of Birth :
                <asp:Label runat="server" ID="lblDob"></asp:Label>
            </p>
            <p>
                Alternate Number :
                <asp:Label runat="server" ID="lblAlt"></asp:Label>
            </p>
            <p>
                Career Summary :
                <asp:Label runat="server" ID="lblCsum"></asp:Label>
            </p>
            <p>
                About me :
                <asp:Label runat="server" ID="lblAbt"></asp:Label>
            </p>
            <p>
                Address :
                <asp:Label runat="server" ID="lblAddr"></asp:Label>
            </p>
            <p>
                Country :
                <asp:Label runat="server" ID="lblCoun"></asp:Label>
            </p>
            <p>
                City :
                <asp:Label runat="server" ID="lblCity"></asp:Label>
            </p>
            <p>
                
            </p>
        </div>
    </div>
</asp:Content>

