<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ApiController;
use App\Http\Controllers\ImageController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('login');
});
route::get('login', function(){
    return view('login');
})->name('login');
//Route::middleware(['admin'])->group(function(){
    // route::get('register', function(){
    //     return view('register');
    // })->name('register');
//});
Route::get('register',[ApiController::class,"addUser"])->name('register');
route::get('image_upload', function(){
    return view('imageupload');
});

Route::get('/get-states/{country_id}', [ApiController::class,"getStates"]);
Route::get('/get-cities/{state_id}', [ApiController::class,"getCities"]);
Route::get('/images', [ImageController::class, 'index'])->name('images.index');
Route::get('/image-search', [ImageController::class, 'search'])->name('images.search');
Route::post('/images', [ImageController::class, 'store'])->name('images.store');
Route::get('/images/search', [ImageController::class, 'search'])->name('images.search');