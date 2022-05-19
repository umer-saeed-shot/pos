@extends('layout.main') @section('content')

@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
@endif
@if ($errors->any())
@foreach ($errors->all() as $error)
<div class="alert alert-warning alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ $error }}</div>
@endforeach
@endif


@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif
<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <h4>Shop Logo</h4>
                    </div>
                    <div class="card-body">

                            <div class="col-md-12">
                                <label for="">Current Logo :</label>
                            </div>
                            <div class="col-md-12">
                                @if ($table == null)
                                    <img src="{{ URL::asset('/public/img/logo/no-logo.png') }}" class="img-rounded" alt="Shop Logo" style="width:250px;height:300px">
                                @else
                                    <img src="{{ URL::asset('/public/img/logo/'.$table['image']) }}" class="img-rounded" alt="Shop Logo" style="width:250px;height:300px">
                                @endif
                            </div>

                        {!! Form::open(['route' => 'setting.uploadlogo', 'files' => true, 'method' => 'post']) !!}
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Image*</label>
                                        <input type="file" name="image" id="image" class="form-control"  required />
                                    </div>
                                </div>
                                <div class="col-md-6 ">
                                    <button type="submit" class="btn btn-primary">{{trans('file.submit')}}</button>
                                </div>
                            </div>
                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


@endsection
