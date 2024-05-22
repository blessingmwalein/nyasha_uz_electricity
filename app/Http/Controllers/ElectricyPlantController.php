<?php

namespace App\Http\Controllers;

use App\Models\City;
use App\Models\ElectricyPlant;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ElectricyPlantController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('ElectricyPlants', [
            'plants' => ElectricyPlant::with('city')->get(),
            'cities' => City::all(),
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
        ElectricyPlant::create($request->all());

        //return back with success message
        return redirect()->back()->with('success', 'Electricy Plant created successfully');
    }

    /**
     * Display the specified resource.
     */
    public function show(ElectricyPlant $electricyPlant)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(ElectricyPlant $electricyPlant)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ElectricyPlant $electricyPlant)
    {

        $plant = ElectricyPlant::find($request->id);

        $plant->update($request->all());

        //return back with success message
        return redirect()->back()->with('success', 'Electricy Plant updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ElectricyPlant $electricyPlant)
    {
        $electricyPlant->delete();
        //return back with success message
        return redirect()->back()->with('success', 'Electricy Plant deleted successfully');
    }
}
