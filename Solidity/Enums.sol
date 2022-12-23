// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Enum
{
    enum Status
    {
        Wishlist,
        Order_Successful,
        Shipped,
        Delivered,
        Cancelled
    }

    Status public Product_Status = Status.Wishlist;
    string public Product = 'Select the Product Which has to place as an Order !!';

    function Change_Status(uint Index) public
    {
        if(Index == 1)
        {
            Product_Status = Status.Order_Successful;
        }
        else if(Index == 2)
        {
            Product_Status = Status.Shipped;
        }
        else if(Index == 3)
        {
            Product_Status = Status.Delivered;
        }
        else if(Index == 4)
        {
            Product_Status = Status.Cancelled;
        }
    }

    function Order_Product()public view returns(string memory MSG)
    {
        if(Product_Status == Status.Order_Successful)
        {
            MSG = 'Product Successfully Ordered !!';
            return MSG;
        }
        else if(Product_Status == Status.Wishlist)
        {
            MSG = 'Product are wishlist (Added in the Favourites)';
            return MSG;
        }
        else if(Product_Status == Status.Cancelled)
        {
            MSG = 'Product has been Cancelled !!';
            return MSG;
        }
        else if(Product_Status == Status.Shipped)
        {
            MSG = 'Product has Shipped From Manufacture !!';
            return MSG;
        }
        else if(Product_Status == Status.Delivered)
        {
            MSG = 'Product has been Delivered Successfully !!';
            return MSG;
        }
    }

}