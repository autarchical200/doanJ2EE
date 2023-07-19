$(document).ready(function() {
    var dataTable = $('#ProductTable').DataTable({
        "serverSide": true,
        ajax: {
            url: 'getProduct.jsp',
            dataSrc: ''
        },
        columns: [
            { data: 'productID' },
            { data: 'productName' },
            { data: 'categoryID' },
            { data: 'brandID' },
            { data: 'price' },
            { data: 'discountedPrice' },
            { data: 'productImg' },
            { data: 'productInfo' },
            {
                data: null,
                render: function(data, type, row) {
                    return '<button class="btn btn-warning editBtn mr-2" data-bs-toggle="modal" data-bs-target="#editProductModal" data-id="' + row.productID + '">Edit</button>'
                        + '<button class="btn btn-danger deleteBtn" data-id="' + row.productID + '">Delete</button>';
                }
            }
        ]
    });
});
