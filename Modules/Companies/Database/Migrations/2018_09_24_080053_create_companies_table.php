<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCompaniesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('companies', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->string('compnay_name');
            $table->string('address');
            $table->string('city');
            $table->string('pin_code');
            $table->string('country');
            $table->string('state');
            $table->string('company_number');
            $table->string('description');
            $table->string('working_days');
            $table->time('start_time');
            $table->time('end_time');
            $table->string('company_logo')->nullable();
            $table->string('official_email');
            $table->string('status')->default("approved");
            $table->integer('admin_email_status')->default(0);
            $table->integer('booking_opening_days');
            $table->integer('booking_per_hour');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('companies');
    }
}
