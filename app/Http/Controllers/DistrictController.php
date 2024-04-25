<?php

namespace App\Http\Controllers;

use App\Models\District;
use App\Models\Town;
use Illuminate\Http\Request;
use Inertia\Inertia;

class DistrictController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('Districts', [
            'districts' => District::with('town')->get(),
            'towns' => Town::all(),
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
        District::create($request->all());
        //return back with success message
        return redirect()->back()->with('success', 'District created successfully');
    }

    /**
     * Display the specified resource.
     */
    public function show(District $district)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(District $district)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, District $district)
    {
        $district->update($request->all());
        //return back with success message
        return redirect()->back()->with('success', 'District updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(District $district)
    {
        $district->delete();
        //return back with success message
        return redirect()->back()->with('success', 'District deleted successfully');
    }
}
