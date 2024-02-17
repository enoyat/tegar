<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'name' => 'Administrator Ipwija',
            'email' => 'administrator@gmail.com',
            'password' => Hash::make('p4ssw0rd'),
            'roles_id' => 1,
        ]);

        DB::table('users')->insert([
            'name' => 'Operator Ipwija',
            'email' => 'operator@gmail.com',
            'password' => Hash::make('p4ssw0rd'),
            'roles_id' => 2,
        ]);

        DB::table('users')->insert([
            'name' => 'Akademik Ipwija',
            'email' => 'akademik@gmail.com',
            'password' => Hash::make('p4ssw0rd'),
            'roles_id' => 3,
        ]);
    }
}
