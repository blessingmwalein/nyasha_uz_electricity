<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('clients', function (Blueprint $table) {
            $table->id();
            $table->string('full_name');
            $table->string('email')->unique();
            $table->string('phone')->unique();
            $table->text('address')->unique();
            $table->integer('number_of_appliances')->unique();
            $table->integer('number_of_residents')->unique();
            $table->foreignId('district_id')->constrained('districts');
            $table->foreignId('city_id')->constrained('cities');
            $table->foreignId('town_id')->constrained('towns');
            $table->foreignId('province_id')->constrained('provinces');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('clients');
    }
};
