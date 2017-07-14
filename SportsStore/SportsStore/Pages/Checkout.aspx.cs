using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsStore.Models.Repository;
using SportsStore.Models;
using SportsStore.Pages.Helpers;
using System.Web.ModelBinding;

namespace SportsStore.Pages
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            checkoutForm.Visible = true;
            checkoutMessage.Visible = false;

            if (IsPostBack)
            {
                Order myOrder=new Order();
                if (TryUpdateModel(myOrder, new FormValueProvider(ModelBindingExcutionContext)))
                {
                    myOrder.OrderLines = new List<OrderLine>();
                    Cart myCart = SessionHelper.GetCart(Session);
                }
            }
        }
    }
}