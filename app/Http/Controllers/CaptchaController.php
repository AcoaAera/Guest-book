<?php

namespace App\Http\Controllers;

use App\Models\Feedback;
use Illuminate\Http\Request;
use Carbon\Carbon;
use hisorange\BrowserDetect\Parser as Browser;
use Illuminate\Support\Facades\Storage;

class CaptchaController extends Controller
{
    private const CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz';
    private const LENGTH = '6';
    private const SALT = '$1$itchief$7';
    private const FONT_SIZE = 36;

    public function fetchCaptcha(Request $req){
        // Сгенерировать код
        $code = substr(str_shuffle(self::CHARS), 0, self::LENGTH);

        // Хранить в куках Captcha (время действия 600 секунд)
        $value = crypt($code, self::SALT);
        $expires = time() + 600;
        setcookie('captcha', $value, $expires, '/', $req->server('SERVER_NAME'), false, true);
        
        // Создать новое изображение из файла
        $image = imagecreatefrompng(Storage::path('files'). '/bg.png');

        // Установить размер шрифта в пунктах
        $size = 36;

        // Создать цвет, который будет использоваться в изображении
        $color = imagecolorallocate($image, 66, 182, 66);

        // Установить путь к шрифту
        $font = Storage::path('files'). '/oswald.ttf';
        // Задать угол в градусах
        $angle = rand(-10, 10);

        // Установить координаты точки для первого символа текста
        $x = 56;
        $y = 64;

        // Наности текст на изображение
        imagefttext($image, self::FONT_SIZE, $angle, $x, $y, $color, $font, $code);

        header('Cache-Control: no-store, must-revalidate');
        header('Expires: 0');
        header('Content-Type: image/png');

        // Вывод изображение
        imagepng($image);

        // Удаление изображение
        imagedestroy($image);
    }

    public function validateCaptcha(Request $req){
        $validated = $req->validate([
            "captcha" => ['required', 'string'],
        ]);

        $captcha = $req->cookie('captcha');
        $host = $req->getHttpHost();

        setcookie('captcha', '', time() - 3600, '/', $req->server('SERVER_NAME'), false, true);

        $code = $validated['captcha'];

        $code = crypt(trim($code), self::SALT);
        if ($captcha === $code){
            return $this->jsonResponse(null);
        }
        else {
            return $this->jsonErrorResponse(false, 'Введенный код не соответствует изображению!');
        }

    }
}
