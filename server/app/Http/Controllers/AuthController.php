<?php

namespace App\Http\Controllers;

use App\Models\User;
use Exception;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    function register(Request $request)
    {
        try {
            $cred = new User();
            $cred->name = $request->name;
            $cred->email = $request->email;
            $cred->password = Hash::make($request->password);
            $cred->phone = "";
            $cred->save();
            $response = ['status' => 200, 'message' => 'Registered successfully!'];
            return response()->json($response);
        } catch (Exception $e) {
            $response = ['status' => 500, 'message' => $e->getMessage()];
        }
    }


    function login(Request $request)
    {
        $user = User::where('email', $request->email)->first();

        if ($user != '[]' && Hash::check($request->password, $user->password)) {
            $token = $user->createToken('Personal Access Token')->plainTextToken;
            $response = ['status' => 200, 'token' => $token, 'user' => $user, 'message' => 'Successfully logged in.'];
            return response()->json($response);
        } else if ($user == '[]') {
            $response = ['status' => 500, 'message' => 'No account found with this email.'];
            return response()->json($response);
        } else {

            $response = ['status' => 500, 'message' => 'Wrong email or password! please try again.'];
            return response()->json($response);
        }
    }
}
