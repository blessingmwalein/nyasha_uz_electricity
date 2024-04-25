<?php

namespace App\Http\Controllers;

use App\Models\Province;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ProvinceController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {


        return Inertia::render('Provinces', [
            'provinces' => Province::all(),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        Province::create($request->all());

        //return back with success message
        return redirect()->back()->with('success', 'Province created successfully');
    }

    /**
     * Display the specified resource.
     */
    public function show(Province $province)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Province $province)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Province $province)
    {
        //
        $province->update($request->all());

        //return back with success message
        return redirect()->back()->with('success', 'Province updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Province $province)
    {
        //
        $province->delete();

        //return back with success message
        return redirect()->back()->with('success', 'Province deleted successfully');
    }
}
