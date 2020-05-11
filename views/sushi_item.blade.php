@extends('layouts.base')

@section('title', '&&& СУШИ !!!Главная страница')

@section('pagetitle', 'Бесплатная доставка роллов от портала «Еда в Рязани»')

@section('content')
  <div class="content">
    <div class="main-content">
      @include('sushi.partials.productitem')
    </div>
  </div>
@endsection