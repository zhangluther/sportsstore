using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsStore.Models;
using SportsStore.Models.Repository;

namespace SportsStore.Pages
{
    public partial class Listing : System.Web.UI.Page
    {
        private Repository repo = new Repository();
        private int pageSize = 2;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        

        protected IEnumerable<Product> GetProducts()
        {
            return FilterProducts()
                .OrderBy(p => p.ProductID)
                .Skip((CurrentPage - 1) * pageSize)
                .Take(pageSize);
        }

        protected int CurrentPage
        {
            get
            {
                int page = GetPageFromRequest();
                return page > MaxPage ? MaxPage : page;
            }
        }

        protected int MaxPage
        {
            get
            {
                int prodCount = FilterProducts().Count();
                return (int) Math.Ceiling((decimal) prodCount / pageSize);
            }
        }

        private int GetPageFromRequest()
        {
            int page;
            string reqValue = (string) RouteData.Values["page"] ?? Request.QueryString["page"];
            return reqValue != null && int.TryParse(reqValue, out page) ? page : 1;
        }

        private IEnumerable<Product> FilterProducts()
        {
            IEnumerable<Product> products = repo.Products;
            string currentCategory = (string) RouteData.Values["category"] ?? Request.QueryString["category"];
            return currentCategory == null ? products : products.Where(p => p.Category == currentCategory);
        }
    }
}