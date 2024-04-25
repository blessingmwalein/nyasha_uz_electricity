<?php

namespace App\Http\Controllers;

use App\Models\City;
use App\Models\Town;
use Illuminate\Http\Request;
use Inertia\Inertia;


class TownController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('Towns', [
            'towns' => Town::with('city')->get(),
            'cities' => City::all()
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
        Town::create($request->all());

        //return back with success message
        return redirect()->back()->with('success', 'Town created successfully');
    }

    /**
     * Display the specified resource.
     */
    public function show(Town $town)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Town $town)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Town $town)
    {
        //updat e
        $town->update($request->all());
        return redirect()->back()->with('success', 'Town updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Town $town)
    {
        $town->delete();
        return redirect()->back()->with('success', 'Town deleted successfully');
    }
}
