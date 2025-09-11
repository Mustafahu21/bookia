import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future pushTo(BuildContext context, String route, {Object? extra}) {
  return context.push(route, extra: extra);
}

pushReplacement(BuildContext context, String route, {Object? extra}) {
  return context.pushReplacement(route, extra: extra);
}

pushRemoveUntil(BuildContext context, String route, {Object? extra}) {
  return context.go(route, extra: extra);
}

pop(BuildContext context) => context.pop();
