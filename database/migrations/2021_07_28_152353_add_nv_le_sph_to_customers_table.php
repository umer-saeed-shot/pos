<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddNvLeSphToCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('customers', function (Blueprint $table) {
             $table->string('dv_le_sph')->nullable();
			 $table->string('dv_le_cyl')->nullable();
			 $table->string('dv_le_axis')->nullable();
			 $table->string('dv_re_sph')->nullable();
			 $table->string('dv_re_cyl')->nullable();
			 $table->string('dv_re_axis')->nullable();
			 
			 $table->string('nv_le_sph')->nullable();
			 $table->string('nv_le_cyl')->nullable();
			 $table->string('nv_le_axis')->nullable();
			 $table->string('nv_re_sph')->nullable();
			 $table->string('nv_re_cyl')->nullable();
			 $table->string('nv_re_axis')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('customers', function (Blueprint $table) {
            $table->dropColumn('dv_le_sph');
			$table->dropColumn('dv_le_cyl');
			$table->dropColumn('dv_le_axis');
			$table->dropColumn('dv_re_sph');
			$table->dropColumn('dv_re_cyl');
			$table->dropColumn('dv_re_axis');
			
			$table->dropColumn('nv_le_sph');
			$table->dropColumn('nv_le_cyl');
			$table->dropColumn('nv_le_axis');
			$table->dropColumn('nv_re_sph');
			$table->dropColumn('nv_re_cyl');
			$table->dropColumn('nv_re_axis');
        });
    }
}
