<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBookingTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        Schema::create('bookings', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->integer('service_id')->unsigned();
            $table->foreign('service_id')->references('id')->on('services')->onDelete('cascade');
            $table->integer('company_id')->unsigned();
            $table->foreign('company_id')->references('id')->on('companies')->onDelete('cascade');
            $table->string('token');
            $table->string('stripe_token')->nullable();
            $table->date('booking_date');
            $table->time('booking_time');
            $table->string('booking_address');
            $table->string('booking_city');
            $table->string('booking_pincode');
            $table->text('booking_note');
            $table->float('total_amt')->default(0);
            $table->float('admin_commission')->default(0);
            $table->string('payment_mode');
            $table->string('status')->default('pending');
            $table->integer('is_completed')->nullable();
           
            $table->string('currency')->default('USD');
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
        Schema::dropIfExists('bookings');
    }
}
