<?php

namespace App\Http\Controllers;

use App\Models\Feedback;
use Illuminate\Http\Request;
use Carbon\Carbon;
use hisorange\BrowserDetect\Parser as Browser;

class FeedbackController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return $this->jsonResponse(Feedback::orderBy('created_at', 'DESC')->get());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            "user_name" => ['required', 'string', 'max:50'],
            "email" => ['required', 'email', 'max:256'],
            "comment" => ['required', 'string', 'max:1000', 'not_regex:/<(\"[^\"]*\"|\'[^\']*\'|[^\'\">])*>/'],
        ]);
        $validated['ip'] = $request->ip();
        $validated['browser'] = Browser::browserName();
        $validated['created_at'] = Carbon::now()->toDateTime();

        Feedback::create($validated);

        $this->jsonResponse(null);
    }
}
