<?php

namespace App\Console;

use App\User;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        //
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {

        $schedule->call(function () {
            $alert_product = DB::table('products')->where('is_active', true)->whereColumn('alert_quantity', '>', 'qty')->count();
            if($alert_product > 0){

                $products = DB::table('products')->where('is_active', true)->whereColumn('alert_quantity', '>', 'qty')->get();
                $pro = ["products"=>$products];
                $users = User::where('role_id',2)->get();
                foreach ($users as $user) {
                    Mail::send( 'mail.stock_alert', $pro, function( $message ) use ($user)
                    {
                        $message->to( $user->email )->subject( 'Stock Alert - POS System' );
                    });
                }
            }
        })->daily();


    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
