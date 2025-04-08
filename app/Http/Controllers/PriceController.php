<?php

namespace App\Http\Controllers;

use App\Models\Price;
use Illuminate\Http\Request;
use App\Http\Requests\StorePriceRequest;
use App\Http\Requests\UpdatePriceRequest;

class PriceController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    /**
     * @OA\Get(
     *     path="/api/prices",
     *     summary="Получить список всех цен",
     *     tags={"Prices"},
     *     @OA\Response(
     *         response=200,
     *         description="Список цен",
     *         @OA\JsonContent(
     *             type="array",
     *             @OA\Items(
     *                 @OA\Property(property="id", type="integer", example=1),
     *                 @OA\Property(property="configuration_id", type="integer", example=10),
     *                 @OA\Property(property="price", type="number", format="float", example=35000),
     *                 @OA\Property(property="start_date", type="string", format="date", example="2025-04-08"),
     *                 @OA\Property(property="end_date", type="string", format="date", example="2025-12-31")
     *             )
     *         )
     *     )
     * )
     */
    public function index()
    {
        // ...
    }


    /**
     * Store a newly created resource in storage.
     */
    /**
     * @OA\Post(
     *     path="/api/prices",
     *     summary="Создать новую цену",
     *     tags={"Prices"},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"configuration_id", "price", "start_date"},
     *             @OA\Property(property="configuration_id", type="integer", example=10),
     *             @OA\Property(property="price", type="number", format="float", example=35000),
     *             @OA\Property(property="start_date", type="string", format="date", example="2025-04-08"),
     *             @OA\Property(property="end_date", type="string", format="date", example="2025-12-31")
     *         )
     *     ),
     *     @OA\Response(
     *         response=201,
     *         description="Цена создана",
     *         @OA\JsonContent(
     *             @OA\Property(property="id", type="integer", example=2),
     *             @OA\Property(property="configuration_id", type="integer", example=10),
     *             @OA\Property(property="price", type="number", format="float", example=35000),
     *             @OA\Property(property="start_date", type="string", format="date", example="2025-04-08"),
     *             @OA\Property(property="end_date", type="string", format="date", example="2025-12-31")
     *         )
     *     )
     * )
     */
    public function store(StorePriceRequest $request)
    {
        $price = Price::create($request->validated());

        return response()->json($price, 201);
    }



    /**
     * Display the specified resource.
     */
    /**
     * @OA\Get(
     *     path="/api/prices/{id}",
     *     summary="Получить цену по ID",
     *     tags={"Prices"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="ID цены",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Цена найдена",
     *         @OA\JsonContent(
     *             @OA\Property(property="id", type="integer", example=1),
     *             @OA\Property(property="configuration_id", type="integer", example=10),
     *             @OA\Property(property="price", type="number", format="float", example=35000),
     *             @OA\Property(property="start_date", type="string", format="date", example="2025-04-08"),
     *             @OA\Property(property="end_date", type="string", format="date", example="2025-12-31")
     *         )
     *     ),
     *     @OA\Response(response=404, description="Цена не найдена")
     * )
     */
    public function show(Price $price)
    {
        // ...
    }


    /**
     * Update the specified resource in storage.
     */
    /**
     * @OA\Put(
     *     path="/api/prices/{id}",
     *     summary="Обновить цену",
     *     tags={"Prices"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="ID цены",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"configuration_id", "price", "start_date"},
     *             @OA\Property(property="configuration_id", type="integer", example=10),
     *             @OA\Property(property="price", type="number", format="float", example=35000),
     *             @OA\Property(property="start_date", type="string", format="date", example="2025-04-08"),
     *             @OA\Property(property="end_date", type="string", format="date", example="2025-12-31")
     *         )
     *     ),
     *     @OA\Response(response=200, description="Цена обновлена"),
     *     @OA\Response(response=404, description="Цена не найдена")
     * )
     */
    public function update(UpdatePriceRequest $request, Price $price)
    {
        $price->update($request->validated());

        return response()->json($price);
    }



    /**
     * Remove the specified resource from storage.
     */
    /**
     * @OA\Delete(
     *     path="/api/prices/{id}",
     *     summary="Удалить цену",
     *     tags={"Prices"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="ID цены",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(response=204, description="Цена удалена"),
     *     @OA\Response(response=404, description="Цена не найдена")
     * )
     */
    public function destroy(Price $price)
    {
        // ...
    }

}
