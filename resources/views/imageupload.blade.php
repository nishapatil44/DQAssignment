@extends('layouts.app')

@section('content')
    <h2>Image Gallery</h2>

    <form action="{{ route('images.store') }}" method="post" enctype="multipart/form-data">
        @csrf
        <div>
            <label for="title">Title:</label>
            <input type="text" name="title" required>
        </div>

        <div>
            <label for="image">Image:</label>
            <input type="file" name="image" required>
        </div>

        <div>
            <label for="tags">Tags:</label>
            <select name="tags[]" multiple required>
                @foreach($tags as $tag)
                    <option value="{{ $tag->id }}">{{ $tag->name }}</option>
                @endforeach
            </select>
        </div>

        <button type="submit">Upload Image</button>
    </form>

    <h3>Search by Tag:</h3>
    <form action="{{ route('images.search') }}" method="get">
        <div>
            <label for="tag_id">Tag:</label>
            <select name="tag_id">
                <option value="">All</option>
                @foreach($tags as $tag)
                    <option value="{{ $tag->id }}">{{ $tag->name }}</option>
                @endforeach
            </select>
        </div>
        <button type="submit">Search</button>
    </form>

    <h3>Images:</h3>
    <div>
        @foreach($images as $image)
            <div>
                <img src="{{ asset('storage/' . $image->image_path) }}" alt="{{ $image->title }}" width="150">
                <p>Title: {{ $image->title }}</p>
                <p>Tags: {{ implode(', ', $image->tags->pluck('name')->toArray()) }}</p>
            </div>
        @endforeach
    </div>
@endsection
