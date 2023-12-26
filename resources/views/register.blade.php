<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>User Form</title>
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3 class="mb-0">User Registration Form</h3>
                </div>
                
                <div class="card-body">
                    <div id="successMessage" class="alert alert-success" style="display: none;">
                        Registration successful!
                    </div>
                    <form method="post" action="/api/register" onsubmit="showSuccessMessage()">
                    @csrf
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="name">Name:</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="mobile">Mobile No:</label>
                                <input type="text" class="form-control" id="mobile" name="mobile" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="password">Password:</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="country">Select Country:</label>
                                <select id="country" name="country" class="form-control" >
                                    @foreach($countries as $country)
                                    <option value="{{ $country->id }}">{{ $country->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="state">Select State:</label>
                                <select id="state" name="state" class="form-control">
                                    
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="city">Select City:</label>
                                <select id="city" name="city" class="form-control">
                                
                                </select>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function showSuccessMessage(){
        document.getElementById('successMessage').style.display = 'block';
    }
    $(document).ready(function(){
        
        $('#country').change(function() {
            
            var countryId = $(this).val();
            // Make an AJAX request to fetch states
            $.ajax({
                url: '/get-states/' + countryId,
                type: 'GET',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                success: function(data) {
                    // Clear existing options
                    $('#state').empty();

                    // Populate states dynamically
                    $.each(data, function(id, name) {
                        $('#state').append(new Option(name, id));
                    });
                },
            });
        });
        $('#state').change(function() {
            
            var stateId = $(this).val();
            // Make an AJAX request to fetch states
            $.ajax({
                url: '/get-cities/' + stateId,
                type: 'GET',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                success: function(data) {
                    // Clear existing options
                    $('#city').empty();

                    // Populate states dynamically
                    $.each(data, function(id, name) {
                        $('#city').append(new Option(name, id));
                    });
                },
            });
        });
    });

</script>
</body>
</html>
