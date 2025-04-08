<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdatePriceRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'configuration_id' => 'sometimes|required|integer|exists:configurations,id',
            'price'            => 'sometimes|required|numeric|min:0',
            'start_date'       => 'sometimes|required|date',
            'end_date'         => 'nullable|date|after_or_equal:start_date',
        ];
    }
}
