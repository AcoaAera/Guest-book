<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFeedbackTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('feedback', function (Blueprint $table) {
            $table->id();
            $table->string('user_name', 50)->comment('Имя пользователя');
            $table->string('email', 256)->comment('E-mail');
            $table->string('comment', 1000)->comment('Комментарий');
            $table->string('ip', 15)->comment('IP адрес');
            $table->string('browser', 255)->comment("Браузер");
            $table->timestamp('created_at', 0);

            $table->index('email');
            $table->index('created_at');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('feedback');
    }
}
