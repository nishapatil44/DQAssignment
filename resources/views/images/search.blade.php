<!-- resources/views/images/index.blade.php -->

@extends('layouts.app')

@section('content')
    <div style="margin: 20px;">
        <h2 style="margin-bottom: 20px;">Image Gallery</h2>


        <h3 style="margin-bottom: 10px;">Search by Tag:</h3>
        <form action="{{ route('images.search') }}" method="get" style="margin-bottom: 20px;">
            <div style="margin-bottom: 10px;">
                <label for="tag_id">Tag:</label>
                <select name="tag_id" style="padding: 8px;">
                    <option value="">All</option>
                    @foreach($tags as $tag)
                        <option value="{{ $tag->id }}">{{ $tag->name }}</option>
                    @endforeach
                </select>
            </div>
            <button type="submit" style="padding: 8px 16px; background-color: #007bff; color: #fff; border: none; cursor: pointer;">Search</button>
        </form>

        <h3 style="margin-bottom: 10px;">Images:</h3>
        <div style="display: flex; flex-wrap: wrap;">
            @foreach($images as $image)
                <div style="margin: 10px; text-align: center;">
                    <img src="{{ asset('storage' . $image->image_path) }}" alt="{{ $image->title }}" style="max-width: 200px; max-height: 150px; border-radius: 5px;">
                    <p style="margin-top: 5px;">Title: {{ $image->title }}</p>
                    <p style="margin-bottom: 15px;">Tags: {{ implode(', ', $image->tags->pluck('name')->toArray()) }}</p>
                </div>
            @endforeach
        </div>
    </div>
@endsection
