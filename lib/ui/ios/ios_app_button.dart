import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

enum AppButtonVariant { normal, multiline, cta }

class AppButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final IconData? icon;
  final Widget? iconWidget;

  // když true → žádný vnější padding/spodní spacing
  final bool compact;
  final bool fullWidth;
  final AppButtonVariant variant;

  const AppButton({
    required this.text,
    required this.color,
    required this.onPressed,
    this.icon,
    this.iconWidget,
    this.compact = false,
    this.fullWidth = true,
    this.variant = AppButtonVariant.normal,
    super.key,
  }) : assert(icon == null || iconWidget == null, 'Použij buď icon, nebo iconWidget, ne obojí.');

  const AppButton.compact({
    required this.text,
    required this.color,
    required this.onPressed,
    this.icon,
    this.iconWidget,
    this.fullWidth = false,
    this.variant = AppButtonVariant.normal,
    super.key,
  }) : compact = true;

  @override
  Widget build(BuildContext context) {
    if (!compact) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: _buildButton(context),
      );
    }
    return _buildButton(context);
  }

  Widget _buildButton(BuildContext context) {
    var cfg = _cfgFor(variant);
    final fg = ThemeData.estimateBrightnessForColor(color) == Brightness.dark
        ? Colors.white
        : CupertinoColors.activeBlue;

    final overflow = (cfg.maxLines > 1) ? TextOverflow.ellipsis : TextOverflow.ellipsis;

    // COMPACT: vždy menší výška + menší vertical padding
    if (compact) {
      cfg = cfg.copyWith(
        minHeight: 40,
        // nebo 44, pokud chceš větší tap target
        vPad: 6,
        // klíčové – ubere “puff”
        hPad: 12,
        fontSize: 14,
        lineHeight: 1.1,
        maxLines: 1, // compact tlačítka typicky 1 řádek
      );
    }

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: cfg.minHeight),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: fg,
            elevation: 0,
            minimumSize: Size(0, cfg.minHeight),
            padding: EdgeInsets.symmetric(horizontal: cfg.hPad, vertical: cfg.vPad),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius12),
            ),
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: cfg.fontSize,
              height: cfg.lineHeight,
            ),
          ),
          child: (icon == null && iconWidget == null)
              ? Text(
                  text,
                  textAlign: TextAlign.center,
                  maxLines: cfg.maxLines,
                  overflow: overflow,
                  softWrap: true,
                )
              : Row(
                  mainAxisSize: MainAxisSize.max, // ✅ využije celou šířku
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: cfg.iconSize + 2, // ✅ stabilní místo pro ikonu
                      child: Center(child: iconWidget ?? Icon(icon, size: cfg.iconSize)),
                    ),
                    const SizedBox(width: padding8),
                    Expanded(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        maxLines: cfg.maxLines,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  _BtnCfg _cfgFor(AppButtonVariant v) {
    switch (v) {
      case AppButtonVariant.multiline:
        return const _BtnCfg(
            minHeight: 60, hPad: 10, vPad: 10, fontSize: 14, lineHeight: 1.15, iconSize: 18, maxLines: 2);
      case AppButtonVariant.cta:
        return const _BtnCfg(
            minHeight: 48, hPad: 16, vPad: 10, fontSize: 15, lineHeight: 1.2, iconSize: 18, maxLines: 2);
      case AppButtonVariant.normal:
      default:
        return const _BtnCfg(
            minHeight: 44, hPad: 16, vPad: 10, fontSize: 14, lineHeight: 1.1, iconSize: 18, maxLines: 1);
    }
  }
}

class _BtnCfg {
  final double minHeight;
  final double hPad;
  final double vPad;
  final double fontSize;
  final double lineHeight;
  final double iconSize;
  final int maxLines;

  const _BtnCfg({
    required this.minHeight,
    required this.hPad,
    required this.vPad,
    required this.fontSize,
    required this.lineHeight,
    required this.iconSize,
    required this.maxLines,
  });

  _BtnCfg copyWith({
    double? minHeight,
    double? hPad,
    double? vPad,
    double? fontSize,
    double? lineHeight,
    double? iconSize,
    int? maxLines,
  }) {
    return _BtnCfg(
      minHeight: minHeight ?? this.minHeight,
      hPad: hPad ?? this.hPad,
      vPad: vPad ?? this.vPad,
      fontSize: fontSize ?? this.fontSize,
      lineHeight: lineHeight ?? this.lineHeight,
      iconSize: iconSize ?? this.iconSize,
      maxLines: maxLines ?? this.maxLines,
    );
  }
}
