<?php

namespace App\Http\Controllers;

use App\Models\Car;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Carbon;
use App\Http\Requests\StoreCarRequest;
use App\Http\Requests\UpdateCarRequest;

class CarController extends Controller
{
    /**
     * @OA\Get(
     *     path="/api/cars/available",
     *     summary="Получить доступные автомобили с актуальными комплектациями и ценами",
     *     tags={"Cars"},
     *     @OA\Response(
     *         response=200,
     *         description="Список автомобилей с актуальными ценами",
     *         @OA\JsonContent(
     *             type="array",
     *             @OA\Items(
     *                 @OA\Property(property="id", type="integer", example=1),
     *                 @OA\Property(property="name", type="string", example="Toyota Camry"),
     *                 @OA\Property(
     *                     property="configurations",
     *                     type="array",
     *                     @OA\Items(
     *                         @OA\Property(property="id", type="integer", example=10),
     *                         @OA\Property(property="name", type="string", example="Comfort"),
     *                         @OA\Property(
     *                             property="options",
     *                             type="array",
     *                             @OA\Items(type="string", example="Leather Seats")
     *                         ),
     *                         @OA\Property(property="current_price", type="number", format="float", example=35000)
     *                     )
     *                 )
     *             )
     *         )
     *     )
     * )
     */
    public function available()
    {
        $cacheKey = 'cars_available';

        $data = Cache::store('redis')->remember($cacheKey, 600, function () {
            $today = Carbon::today();

            return Car::with(['configurations' => function ($query) use ($today) {
                $query->whereHas('prices', function ($priceQuery) use ($today) {
                    $priceQuery->where('start_date', '<=', $today)
                               ->where(function ($q) use ($today) {
                                   $q->whereNull('end_date')->orWhere('end_date', '>=', $today);
                               });
                })->with([
                             'options',
                             'prices' => function ($q) use ($today) {
                                 $q->where('start_date', '<=', $today)
                                   ->where(function ($q) use ($today) {
                                       $q->whereNull('end_date')->orWhere('end_date', '>=', $today);
                                   })
                                   ->orderByDesc('start_date');
                             }
                         ]);
            }])->get()->map(function ($car) {
                return [
                    'id' => $car->id,
                    'name' => $car->name,
                    'configurations' => $car->configurations->map(function ($config) {
                        $currentPrice = $config->prices->first(); // Самая свежая актуальная цена
                        return [
                            'id' => $config->id,
                            'name' => $config->name,
                            'options' => $config->options->pluck('name'),
                            'current_price' => $currentPrice?->price,
                        ];
                    })->filter(fn ($cfg) => $cfg['current_price'] !== null)->values(),
                ];
            })->filter(fn ($car) => $car['configurations']->isNotEmpty())->values();
        });

        return response()->json($data);
    }

    /**
     * Display a listing of the resource.
     */
    /**
     * @OA\Get(
     *     path="/api/cars",
     *     summary="Получить список всех автомобилей",
     *     tags={"Cars"},
     *     @OA\Response(
     *         response=200,
     *         description="Успешный ответ",
     *         @OA\JsonContent(
     *             type="array",
     *             @OA\Items(
     *                 @OA\Property(property="id", type="integer", example=1),
     *                 @OA\Property(property="name", type="string", example="Toyota Camry")
     *             )
     *         )
     *     )
     * )
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    /**
     * @OA\Post(
     *     path="/api/cars",
     *     summary="Создать новый автомобиль",
     *     tags={"Cars"},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"name"},
     *             @OA\Property(property="name", type="string", example="Toyota Corolla")
     *         )
     *     ),
     *     @OA\Response(
     *         response=201,
     *         description="Автомобиль создан",
     *         @OA\JsonContent(
     *             @OA\Property(property="id", type="integer", example=2),
     *             @OA\Property(property="name", type="string", example="Toyota Corolla")
     *         )
     *     )
     * )
     */

    public function store(StoreCarRequest $request)
    {
        $car = Car::create($request->validated());

        return response()->json($car, 201);
    }


    /**
     * Display the specified resource.
     */
    /**
     * @OA\Get(
     *     path="/api/cars/{id}",
     *     summary="Получить информацию об автомобиле",
     *     tags={"Cars"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="ID автомобиля",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Информация об автомобиле",
     *         @OA\JsonContent(
     *             @OA\Property(property="id", type="integer", example=1),
     *             @OA\Property(property="name", type="string", example="Toyota Camry")
     *         )
     *     ),
     *     @OA\Response(response=404, description="Автомобиль не найден")
     * )
     */
    public function show(Car $car)
    {
        // ...
    }


    /**
     * Update the specified resource in storage.
     */
    /**
     * @OA\Put(
     *     path="/api/cars/{id}",
     *     summary="Обновить данные автомобиля",
     *     tags={"Cars"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="ID автомобиля",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             @OA\Property(property="name", type="string", example="Toyota Camry Updated")
     *         )
     *     ),
     *     @OA\Response(response=200, description="Автомобиль обновлён"),
     *     @OA\Response(response=404, description="Автомобиль не найден")
     * )
     */

    public function update(UpdateCarRequest $request, Car $car)
    {
        $car->update($request->validated());

        return response()->json($car);
    }


    /**
     * Remove the specified resource from storage.
     */
    /**
     * @OA\Delete(
     *     path="/api/cars/{id}",
     *     summary="Удалить автомобиль",
     *     tags={"Cars"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="ID автомобиля",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(response=204, description="Автомобиль удалён"),
     *     @OA\Response(response=404, description="Автомобиль не найден")
     * )
     */
    public function destroy(Car $car)
    {
        //
    }
}
