<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('roles')->insert([
            'id' => 1,
            'role_name' => 'administrator',
        ]);

        DB::table('roles')->insert([
            'id' => 2,
            'role_name' => 'operator',
        ]);

        DB::table('roles')->insert([
            'id' => 3,
            'role_name' => 'akademik',
        ]);
    }
}
