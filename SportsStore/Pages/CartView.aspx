<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Store.Master" AutoEventWireup="true" CodeBehind="CartView.aspx.cs" Inherits="SportsStore.Pages.CartView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <h2>You Cart</h2>
        <table id="cartTable">
            <thead><tr>
                <th>Quantity</th>
                <th>Item</th>
                <th>Price</th>
                <th>Subtotal</th>
            </tr></thead>
            <tbody>
            <asp:Repeater ItemType="SportsStore.Models.CartLine" SelectMethod="GetCartLines" runat="server" EnableViewState="False">
                <ItemTemplate>
                    <tr>
                    <td><%# Item.Quantity %></td>
                    <td><%# Item.Product.Name %></td>
                    <td><%# Item.Product.Price.ToString("c") %></td>
                    <td><%# ((Item.Quantity * Item.Product.Price).ToString("c")) %></td>
                    <td><button type="submit" class="actionButtons" name="remove" value="<%# Item.Product.ProductID %>">REmove</button></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="3">Total:</td>
                <td><%= CartTotal.ToString("c") %></td>
            </tr>
            </tfoot>
        </table>
        <p class="actionButtons">
            <a href="<%= ReturnUrl %>">Continue shopping</a>
            <a href="<%= CheckoutUrl %>">Checkout</a>
        </p>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
