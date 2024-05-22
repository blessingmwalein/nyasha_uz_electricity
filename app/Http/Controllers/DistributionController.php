<?php

namespace App\Http\Controllers;

use App\Models\City;
use App\Models\Distribution;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Inertia\Inertia;

class DistributionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $distributions = Distribution::where('month', $this->getCurrentMonthNameCamelCase())->get();

        return Inertia::render('Distributions', [
            'distributions' => $distributions,
        ]);
    }

    //search by month
    public function search(Request $request)
    {
        $month = $request->month;
        $distributions = Distribution::where('month', $month)->get();

        return Inertia::render('Distributions', [
            'distributions' => $distributions,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    public static function getCurrentMonthNameCamelCase()
    {
        $monthNames = [
            'January', 'February', 'March', 'April', 'May', 'June',
            'July', 'August', 'September', 'October', 'November', 'December'
        ];
        $currentMonthIndex = date('n') - 1; // 'n' returns a month index from 1 to 12
        $currentMonth = $monthNames[$currentMonthIndex];
        return lcfirst($currentMonth);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        Distribution::create($request->all());

        //return back with success message
        return redirect()->back()->with('success', 'Distribution created successfully');
    }

    /**
     * Display the specified resource.
     */
    public function show(Distribution $distribution)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Distribution $distribution)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Distribution $distribution)
    {
        $distribution->update($request->all());

        //return back with success message
        return redirect()->back()->with('success', 'Distribution updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Distribution $distribution)
    {
        $distribution->delete();

        //return back with success message
        return redirect()->back()->with('success', 'Distribution deleted successfully');
    }

    public function getEnergyDistributionsFromModel(Request $request)
    {
        $month = $request->month;

        // Query the cities table using Eloquent
        $cities = City::pluck('name')->toArray();


        // Create the payload
        $payload = [
            'cities' => $cities,
            'month' => $month
        ];

        // dd($payload);

        $aiModeBaeUrl = env('AI_MODEL_BASE_URL');
        // Send POST request to AI model API
        $response = Http::post($aiModeBaeUrl . '/distribute_energy', $payload);

        // Check for successful response
        if ($response->successful()) {
            $distributionPlans = $response->json();

            // Store the distribution plans in the database
            foreach ($distributionPlans as $plan) {
                Distribution::create([
                    'month' => $month,  // Store the current date
                    'target_city' => $plan['city'],
                    'distribution_schedule' => json_encode($plan['allocated_energy']),
                    'capacity' => $plan['predicted_consumption'],
                    'distribution_status' => $plan['status'],
                    'shortfall' => $plan['shortfall'] ?? null,
                    'mae' => $plan['accuracy_metrics']['Mean Absolute Error (MAE) Percentage'] ?? null,
                    'rmse' => $plan['accuracy_metrics']['Root Mean Squared Error (RMSE) Percentage'] ?? null,
                ]);
            }

            return back()->with('success', 'Distribution plans created successfully');
        } else {
            return back()->with('error', 'Failed to create distribution plans');
        }
    }
}
