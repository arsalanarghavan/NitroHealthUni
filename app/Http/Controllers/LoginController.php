<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);
        if (Auth::attempt($request->only('email', 'password')))
        {
            return response()->json(Auth::guard('web')->user(), 200);
        }
        throw ValidationException::withMessages([
            'email' => ['نام کاربری یا رمز اشتباه است'] //generating an error that will come as a response to the console and
        ]);
    }

    public function logout()
    {
        Auth::logout();
    }
}
