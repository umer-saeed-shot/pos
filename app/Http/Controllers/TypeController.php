<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Type;
use App\Product;
use DB;
use Auth;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Illuminate\Validation\Rule;

class TypeController extends Controller
{
    public function index()
    {

            $lims_types = Type::where('is_active', true)->pluck('name', 'id');
            $lims_type_all = Type::where('is_active', true)->get();
            return view('type.create',compact('lims_types', 'lims_type_all'));

    }



    public function store(Request $request)
    {
        $request->name = preg_replace('/\s+/', ' ', $request->name);
        $this->validate($request, [
            'name' => [
                'max:255',
                    Rule::unique('types')->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],

        ]);

        $lims_type_data['name'] = $request->name;

        $lims_type_data['is_active'] = true;
        Type::create($lims_type_data);
        return redirect('type')->with('message', 'Type inserted successfully');
    }

    public function edit($id)
    {
        $lims_type_data = Type::findOrFail($id);

        return $lims_type_data;
    }

    public function typeData(Request $request)
    {
        try {
            $columns = array(
            0 =>'id',
            2 =>'name',
            3=> 'is_active',
        );

            $totalData = Type::where('is_active', true)->count();
            $totalFiltered = $totalData;

            if ($request->input('length') != -1) {
                $limit = $request->input('length');
            } else {
                $limit = $totalData;
            }
            $start = $request->input('start');
            $order = $columns[$request->input('order.0.column')];
            $dir = $request->input('order.0.dir');
            if (empty($request->input('search.value'))) {
                $types = Type::offset($start)
                        ->where('is_active', true)
                        ->limit($limit)
                        ->orderBy($order, $dir)
                        ->get();
            } else {
                $search = $request->input('search.value');
                $types =  Type::where([
                            ['name', 'LIKE', "%{$search}%"],
                            ['is_active', true]
                        ])->offset($start)
                        ->limit($limit)
                        ->orderBy($order, $dir)->get();

                $totalFiltered = Type::where([
                            ['name','LIKE',"%{$search}%"],
                            ['is_active', true]
                        ])->count();
            }
            $data = array();
            //echo '<pre>'; print_r($categories); exit;
            if (!empty($types)) {
                foreach ($types as $key=>$type) {
                    $nestedData['id'] = $type->id;
                    $nestedData['key'] = $key;


                    $nestedData['name'] = $type->name;



                    $nestedData['options'] = '<div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'.trans("file.action").'
                              <span class="caret"></span>
                              <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li>
                                    <button type="button" data-id="'.$type->id.'" class="open-EditCategoryDialog btn btn-link" data-toggle="modal" data-target="#editModal" ><i class="dripicons-document-edit"></i> '.trans("file.edit").'</button>
                                </li>
                                <li class="divider"></li>'.
                                \Form::open(["route" => ["type.destroy", $type->id], "method" => "DELETE"]).'
                                <li>
                                  <button type="submit" class="btn btn-link" onclick="return confirmDelete()"><i class="dripicons-trash"></i> '.trans("file.delete").'</button>
                                </li>'.\Form::close().'
                            </ul>
                        </div>';
                    $data[] = $nestedData;
                }
            }
            $json_data = array(
                    "draw"            => intval($request->input('draw')),
                    "recordsTotal"    => intval($totalData),
                    "recordsFiltered" => intval($totalFiltered),
                    "data"            => $data
                    );

            echo json_encode($json_data);
        }catch(\Exception $ex){
            return $ex->getMessage();
        }
    }

    public function update(Request $request)
    {

        $this->validate($request,[
            'name' => [
                'max:255',
                Rule::unique('types')->ignore($request->type_id)->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],

        ]);

        $input = $request->except('image');

        $lims_type_data = Type::findOrFail($request->type_id);
        $lims_type_data->update($input);
        return redirect('type')->with('message', 'Type updated successfully');
    }



    public function deleteBySelection(Request $request)
    {
        $type_id = $request['typeIdArray'];
        foreach ($type_id as $id) {
            $lims_product_data = Product::where('type', $id)->get();
            foreach ($lims_product_data as $product_data) {
                $product_data->is_active = false;
                $product_data->save();
            }
            $lims_type_data = Type::findOrFail($id);

            $lims_type_data->is_active = false;
            $lims_type_data->save();
        }
        return 'Type deleted successfully!';
    }

    public function destroy($id)
    {
        $lims_type_data = Type::findOrFail($id);
        $lims_type_data->is_active = false;
        $lims_product_data = Product::where('type', $id)->get();
        foreach ($lims_product_data as $product_data) {
            $product_data->is_active = false;
            $product_data->save();
        }

        $lims_type_data->save();
        return redirect('type')->with('not_permitted', 'Type deleted successfully');
    }
}
