# Каталог доменных событий (Event Registry)

Каждое событие отражает свершившийся факт в прошлом и используется для асинхронного уведомления других Bounded Contexts.

| Название события | Источник (Publisher) | Семантика (Бизнес-смысл) | Минимальный контракт (Payload) |
| :--- |:---------------------| :--- | :--- |
| **PatientRegistered** | Медицина             | В системе появился новый пациент. Финтех может завести ему внутренний счет. | `{ patient_id, full_name, dob, phone_hash }` |
| **AppointmentCompleted** | Медицина             | Прием физически завершен. Триггер для выставления счета и создания черновика в ЭМК. | `{ appointment_id, patient_id, doctor_id, services: [], timestamp }` |
| **AIAnalysisRequested** | Медицина             | Врач запросил анализ снимка ИИ-моделью. Данные обезличены для передачи в публичное облако. | `{ request_id, image_s3_path, patient_id_hash, modality }` |
| **AIAnalysisCompleted** | ИИ                   | Нейросеть закончила анализ снимка. Готов предикт. | `{ request_id, analysis_id, result_summary, confidence_score }` |
| **InvoiceCreated** | Финтех               | Сформирован счет на оплату услуг. Триггер для пуш-уведомления клиенту в мобильном приложении. | `{ invoice_id, patient_id, total_amount, currency, due_date }` |
| **InvoicePaid** | Финтех     | Счет успешно оплачен. | `{ invoice_id, patient_id, payment_method, timestamp }` |