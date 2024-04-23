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
        Schema::create('distributions', function (Blueprint $table) {
            $table->id();
            $table->date('date');
            $table->integer('target_districts');
            $table->integer('target_towns');
            $table->integer('target_cities');
            $table->string('distribution_schedule');
            $table->float('capacity');
            $table->enum('distribution_status', ['pending', 'completed'])->default('pending')->index;

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('distributions');
    }
};
