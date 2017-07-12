<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listing.aspx.cs" Inherits="SportsStore.Pages.Listing" MasterPageFile="Store.Master" %>
<%@ Import namespace="System.Web.Routing" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">    
<div id="content">
        <% foreach (SportsStore.Models.Product prod in GetProducts())
           {
               Response.Write("<div class='item'>");
                Response.Write(string.Format("<h3>{0}</h3>", prod.Name));
                Response.Write(prod.Description);
                Response.Write(string.Format("<h4>{0:c}</h4>", prod.Price));
                Response.Write("</div>");
           } %>
    </div>
    <div class="pager">
        <% for (int i = 1; i <= MaxPage; i++)
           {
               string path = RouteTable.Routes.GetVirtualPath(null, null, new RouteValueDictionary() {{"page", i}}).VirtualPath;
                Response.Write(string.Format("<a href='{0}' {1}>{2}</a>",path,i==CurrentPage ? "class='selected'":"",i));
           } %>
    </div>
</asp:Content>

