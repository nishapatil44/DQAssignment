<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ApiController;
use App\Http\Controllers\ApiAssignment;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post("user_login", [ApiController::class, "login"]);
Route::post("register", [ApiController::class, "register"]);
Route::group([
    "middleware" => ["auth:api", "admin"]
], function(){
    Route::get("profile", [ApiController::class, "profile"]);
    Route::post("register_api", [ApiAssignment::class, "register"]);
    
});

Route::group([
    "middleware" => ["auth:api", "activeuser"]
], function(){
    Route::get("active_user_login", [ApiAssignment::class, "userLogin"]);
});

Route::group([
    "middleware" => ["auth:api"]
], function(){
    Route::post("upload_images", [ApiAssignment::class, "store"]);
});


Route::post("login_api", [ApiAssignment::class, "login"]);

