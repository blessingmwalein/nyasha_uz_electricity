<?php

namespace App\Http\Controllers;

use App\Models\Client;
use App\Models\Distribution;
use App\Models\ElectricyPlant;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;


class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    public function dashboard()
    {
        // Get total generated energy from plants
        $totalGeneratedEnergy = ElectricyPlant::sum('generation');

        // Get count of plants and clients
        $plantsCount = ElectricyPlant::count();
        $clientsCount = Client::count();

        // Group distributions by month and get the count
        $distributionsByMonth = Distribution::select('month', DB::raw('COUNT(*) as count'))
            ->groupBy('month')
            ->orderBy(DB::raw('STR_TO_DATE(month, "%M")')) // Convert month name to date to sort
            ->get();

        return Inertia::render('Dashboard', [
            'plants_count' => $plantsCount,
            'clients_count' => $clientsCount,
            'totalGeneratedEnergy' => $totalGeneratedEnergy,
            'algorithEfficiency' => "90%",
            'distributionsByMonth' => $distributionsByMonth,
        ]);
    }
}
