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
            $table->string('month');
            $table->string('target_city');
            $table->json('distribution_schedule');
            $table->float('capacity');
            $table->string('distribution_status');
            $table->string('shortfall')->nullable();
            $table->string('mae')->nullable();
            $table->string('rmse')->nullable();
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
