<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    protected function jsonResponse($data, $status = 200){
        return response()->json([
            'result' => $data
        ], $status);
    }

    protected function jsonErrorResponse($error, $details = NULL, $status = 500){
        return response()->json([
            'error' => $error,
            'details' => $details,
        ], $status);
    }
}
