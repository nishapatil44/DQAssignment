<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Image;
use App\Models\Tag;


class ImageController extends Controller
{
    public function index()
    {
        $images = Image::with('tags')->get();
        $tags = Tag::all();

        return view('images.index', compact('images', 'tags'));
    }
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'tags' => 'required|array',
        ]);

        $image = new Image();
        $image->title = $request->title;

        // Handle image upload
        $imagePath = $request->file('image')->store('images', 'public');
        $image->image_path = $imagePath;

        $image->save();

        // Attach tags to the image
        $tags = $request->tags;
        $image->tags()->sync($tags);

        return redirect()->route('images.index')->with('success', 'Image uploaded successfully.');
    }

    public function search(Request $request)
    {
        $tagId = $request->tag_id;

        if ($tagId) {
            $images = Tag::find($tagId)->images;
        } else {
            $images = Image::with('tags')->get();
        }

        $tags = Tag::all();

        return view('images.search', compact('images', 'tags'));
    }
}