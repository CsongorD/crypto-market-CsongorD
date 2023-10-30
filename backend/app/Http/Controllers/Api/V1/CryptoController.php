<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Crypto;
use App\Http\Requests\StoreCryptoRequest;
use App\Http\Requests\UpdateCryptoRequest;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class CryptoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $CRYPTO_API =  env("CRYPTO_API");
        $url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest';
        $parameters = [
            'start' => '1',
            'limit' => '5000',
            'convert' => 'USD'
        ];
        $headers = [
            'Accepts' => 'application/json',
            "X-CMC_PRO_API_KEY" => $CRYPTO_API
        ];
        $response =  Http::withHeaders($headers)->get($url);
        Log::info($response->body());
        return json_decode($response->body());
        //return Crypto::all();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreCryptoRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Crypto $crypto)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Crypto $crypto)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCryptoRequest $request, Crypto $crypto)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Crypto $crypto)
    {
        //
    }
}
